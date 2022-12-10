package com.infinite.hospital_management_system;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.component.UIInput;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;


@ManagedBean
@SessionScoped
public class HospitalDao {
	SessionFactory sessionFactory;
	PreparedStatement preparedStatement;
	Connection connection;
	
	
	//searching users to check if he/she already exists for signup
	public List<Users> searchUser(String username){
        sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(Users.class);
        criteria.add(Restrictions.eq("username", username));
        List<Users> userlist = criteria.list();
        return userlist;
    }
    
    public boolean validateUser(String userName) {
		List<Users> userlist = searchUser(userName);
		if(userlist.size() > 0) {
		    return true;
		}
		else {
		    return false;
		}
    }
	
	public String signup(Users users) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		boolean username = validateUser(users.getUsername());
		FacesContext context = FacesContext.getCurrentInstance();
		
        if(username == true) {
             context.addMessage(null, new FacesMessage("User already Exists, try some other username."));
             return null;
        }
        else {
	        Transaction transaction = session.beginTransaction();
	        session.save(users);
	        transaction.commit();
	        session.close();
			
			return "user-login.xhtml?faces-redirect=true";
        }
	}
	
	//login
	public String login(String username, String password) throws IOException {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("SELECT count(*) FROM Users WHERE username = :username AND password = :password");
		query.setParameter("username", username);
		query.setParameter("password", password);
		Long count = (Long) query.list().get(0);
		
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext externalContext = context.getExternalContext();
		
		if (count == 0) {
            context.addMessage(null, new FacesMessage("Unknown login, try again"));
            username = null;
            password = null;
            return null;
        } else {
            externalContext.getSessionMap().put("username", username);
            externalContext.redirect("index.jsp");
            return null;
        }
	}
	
	
	//LOGOUT Method
	public String logout() throws IOException {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext externalContext = context.getExternalContext();
		externalContext.getSessionMap().remove("username");
		externalContext.redirect("user-login.xhtml");
		
		return null;
	}
	
	
	//AddPatient
	public String addPatient(Patient patient) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(patient);
		transaction.commit();
		session.close();
		return "show-patient.xhtml?faces-redirect=true";
	}

	//ShowPatient
	public List<Patient> showPatient(){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query =  session.createQuery("from Patient");
		List<Patient> patientlist = query.list();
		return patientlist;
	}
	
	//SearchPatient
	public List<Patient> searchPatient(int patientId) {		
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Patient.class);
		criteria.add(Restrictions.eq("patientId", patientId));
		List<Patient> patientlist = criteria.list();
		return patientlist;
	}
	
	//ShowMedHistory
    public List<MedicalHistory> showMedicalHistory(){
        sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();
        Query query =  session.createQuery("from MedicalHistory");
        List<MedicalHistory> medicalHistorylist = query.list();
        return medicalHistorylist;
    }
    
    //AddMedicalHistory
    public String addMedicalHistory(MedicalHistory medicalHistory) {
        sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(medicalHistory);
        transaction.commit();
        session.close();
        
        return "show-medical-history.xhtml?faces-redirect=true";
    }

    //searchMedicalHistory 
    @SuppressWarnings("unchecked")
	public List<MedicalHistory> searchMedicalHistory(int patientId) {
        return SessionHelper.getConnection().openSession().createQuery("from MedicalHistory where patientId = " + patientId).list();
    }
    
  //SearchPayments
  	public List<Payment> searchPayment(int paymentId) {
  		sessionFactory = SessionHelper.getConnection();
  		Session session = sessionFactory.openSession();
  		Criteria criteria = session.createCriteria(Payment.class);
  		criteria.add(Restrictions.eq("paymentId",paymentId));
  		List<Payment> paymentlist = criteria.list();
  		return paymentlist;
  	}
  	
  	//Number of dates between admitting date and discharge date
  	public int noOfDays(Date admittingDate, Date dischargeDate) {
		int totalDays= dischargeDate.getDate() - admittingDate.getDate();
		return ++totalDays;
	}
  	
  	//search payment by treatment id
  	public double searchPaymentByTreatmentID(int treatmentId) {
  		double dueAmount = 0;
  		sessionFactory = SessionHelper.getConnection();
  		Session session = sessionFactory.openSession();
  		
  		Long count = (Long) session.createQuery("SELECT count(*) from Payment where treatment_id = " + treatmentId).list().get(0);
  		
  		if(count > 0){
  			dueAmount = (double) session.createQuery("SELECT sum(amount) from Payment WHERE treatment_id = :treatment_id group by treatment_id").setParameter("treatment_id", treatmentId).list().get(0);
  		}
		return dueAmount;
	}
  	
  	//Total due amount
  	public double dueAmount(int treatmentId) {
  		Treatment treatment = searchTreatment(treatmentId).get(0);
  		
  		double roomCost = 0;
  		if (treatment.getRoomId() > 0) {
  			Room room = searchRoomById(treatment.getRoomId());
  			int noOfDays = noOfDays(treatment.getTreatmentdate(), treatment.getDischargedate());
			roomCost = room.getRoomCost() * noOfDays;
		}
  		
  		Issues issues = searchIssue(treatment.getIssueId()).get(0);
  		
  		
  		double amount = searchPaymentByTreatmentID(treatmentId);
  		
  
  		return (roomCost + issues.getTreatmentCost()) - amount;
	}
  	
  	
  	//AddPayment
	public void addPayment(Payment payment) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		java.util.Date date = new java.util.Date();
		Date paymentdate = new Date(date.getTime());
		payment.setPaymentDate(paymentdate);
		payment.setDueAmount(payment.getDueAmount() - payment.getAmount());
		
		Transaction transaction = session.beginTransaction();
		session.save(payment);
		transaction.commit();
		session.close();
	}
	
	//ShowPayments
	
	public List<Payment> showPayments(){
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query =  session.createQuery("from Payment");
		List<Payment> paymentlist = query.list();
		return paymentlist;
		
	}
    
	
	//Admission of patient
	public String admitPatient(Admission admission) {
		Session session = SessionHelper.getConnection().openSession();
		
		session.save(admission);
		session.beginTransaction().commit();
		
		return "Patient Admited.";
	}
	
	
	public Date convertDate(java.util.Date dt) {
        java.sql.Date sqlDate=new java.sql.Date(dt.getTime());
        return sqlDate;
    }
	
	//Available rooms
	@SuppressWarnings("unchecked")
	public List<Integer> showAvailableRooms() {
		return (List<Integer>) SessionHelper.getConnection().openSession().createQuery("SELECT roomId from Room where status = 'AVAILABLE' ").list();
	}
	
	public Room searchRoomById(int roomId) {
		return (Room) SessionHelper.getConnection().openSession().createQuery("from Room where roomId = " + roomId).list().get(0);
	}
	
	public Doctor searchDoctorById(int doctorId) {
		return (Doctor) SessionHelper.getConnection().openSession().createQuery("from Doctor where doctorId =" + doctorId).list().get(0);
	}
    
	@SuppressWarnings("unchecked")
	public List<Doctor> showAllAvailableDoctors() {
		return (List<Doctor>) SessionHelper.getConnection().openSession().createQuery("from Doctor where doctorStatus = 'AVAILABLE'").list();
	}
	
	public List<Issues> showAllIssues() {
		return (List<Issues>) SessionHelper.getConnection().openSession().createQuery("from Issues").list();
	}
	
	//current date
	public java.sql.Date currentDate() {
		return new java.sql.Date(new java.util.Date().getTime());
	}
	
	//AddTreatment  
    public void addTreatment(Treatment treatment) {
    	sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();  
        
        treatment.setTreatmentdate(currentDate());
        
        session.save(treatment);
        session.beginTransaction().commit();
        session.close();
        
        if(treatment.getRoomId() > 0){
	        session = sessionFactory.openSession();
	        Room room = searchRoomById(treatment.getRoomId());
	        room.setStatus("UNAVAILABLE");
	        session.update(room);
	        session.beginTransaction().commit();
	        session.close();
        }
        
        if (treatment.getVisitingOrAdmitting() == 1) {
        	Doctor doctor = searchDoctorById(treatment.getDoctorid());
        	doctor.setDoctorStatus("UNAVAILABLE");
        	
        	session = sessionFactory.openSession();
        	session.update(doctor);
        	session.beginTransaction().commit();
        	session.close();  	
		}
        
    }
    
    //ShowTreatment
    @SuppressWarnings("unchecked")
	public List<Treatment> showTreatment(){
        return (List<Treatment>) SessionHelper.getConnection().openSession().createQuery("from Treatment").list();
    }
    
    //SearchTreatment
    public List<Treatment> searchTreatment(int treatmentId) {
	    return (List<Treatment>) SessionHelper.getConnection().openSession().createCriteria(Treatment.class).add(Restrictions.eq("treatmentId", treatmentId)).list();
    }
    
    //Discharge
    public void discharge(int treatmentId) {
    	Session session = SessionHelper.getConnection().openSession();
    	
        Treatment treatment = searchTreatment(treatmentId).get(0);
        treatment.setDischargedate(new java.sql.Date(new java.util.Date().getTime()));
        session.update(treatment);
        session.beginTransaction().commit();
        session.close();
        
        Doctor doctor = searchDoctorById(treatment.getDoctorid());
        doctor.setDoctorStatus("AVAILABLE");
        
        session = SessionHelper.getConnection().openSession();
        session.update(doctor);
        session.beginTransaction().commit();
        session.close();  
        
        Room room = searchRoomById(treatment.getRoomId());
        room.setStatus("AVAILABLE");
        
        session = SessionHelper.getConnection().openSession();
        session.update(room);
        session.beginTransaction().commit();
        session.close();
	}
    
    //search issue
    public List<Issues> searchIssue(int issueId) {
		return (List<Issues>) SessionHelper.getConnection().openSession().createQuery("from Issues where issueId = " + issueId).list();
	}
    
    
    //show Doctor 
    public List<Doctor> showAllDoctors() {
		return SessionHelper.getConnection().openSession().createQuery("from Doctor").list();
	}
	
	//Add Doctor
	public String addDoctor(Doctor doctor) {
		Session session = SessionHelper.getConnection().openSession();
		doctor.setDoctorStatus("AVAILABLE");
		session.save(doctor);
		session.beginTransaction().commit();
		session.close();
		
		return "show-doctors.xhtml?faces-redirect=true";
	}

	 
	//ADD Issue
    public String addIssue(Issues issues) {
        sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(issues);
        transaction.commit();
        session.close();
        return "show-issues.xhtml?faces-redirect=true";
    }
    
    //Show Issues
    public List<Issues> showIssues() {
        sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();
        Query query = session.createQuery("from Issues");
        List<Issues> issuesList = query.list();
        return issuesList;
    }
    
    //Add Room
    public void addRoom(double roomCost) {
    	sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();
        
        Room room = new Room();
        room.setRoomCost(roomCost);
        room.setStatus("AVAILABLE");
        
        session.save(room);
        session.beginTransaction().commit();
        session.close();
	}
    
    //Show Rooms
    @SuppressWarnings("unchecked")
	public List<Room> showRooms() {
    	sessionFactory = SessionHelper.getConnection();
        Session session = sessionFactory.openSession();
        
        List<Room> roomList = session.createQuery("from Room").list();
        return roomList;
	}
	
	
    //Validations
    public void validateName(FacesContext context, UIComponent comp, Object value) {
    	System.out.println("inside validate method");
    	String mno = (String) value;
        String pattern = "(?=.*[a-z])(?=.*[A-Z])(?=.*[\\s]).{8,}";
        boolean result = mno.matches(pattern);
        
        if(result==false) {
        	((UIInput) comp).setValid(false);
            FacesMessage message = new FacesMessage("invalid Name");
            context.addMessage(comp.getClientId(context), message);
        }
    }
    
    public void validateAddress(FacesContext context, UIComponent comp, Object value) {
    	System.out.println("inside validate method");
        String mno = (String) value;
        String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[/\\s]).{8,}";
        boolean result=mno.matches(pattern);
        if(result==false) {
        	((UIInput) comp).setValid(false);
            FacesMessage message = new FacesMessage("invalid Address");
            context.addMessage(comp.getClientId(context), message);
         }
    }
    
    public void validateMobNo(FacesContext context, UIComponent comp,
	    Object value) {

	    System.out.println("inside validate method");

	    String mno = (String) value;
	    boolean flag = false;
	    if (mno.matches("\\d{10}")) {
	        flag = true;
	    }

	    if (flag == false) {
	        ((UIInput) comp).setValid(false);

	        FacesMessage message = new FacesMessage("Mobile Number is NOT valid, please enter a valid mobile number and try again.");
	        context.addMessage(comp.getClientId(context), message);
	    }
    }

	public void validateEmail(FacesContext context, UIComponent comp,
	    Object value) {

	    System.out.println("inside validate method");

	    String mno = (String) value;
	    if (mno.indexOf('@') == -1) {
	        ((UIInput) comp).setValid(false);

	        FacesMessage message = new FacesMessage(
	            "invalid Email Id");
	        context.addMessage(comp.getClientId(context), message);
	    }
	}

	public void validateDes(FacesContext context, UIComponent comp,
	    Object value) {

	    System.out.println("inside validate method");

	    String mno = (String) value;
	    String pattern = "(?=.*[a-z])(?=.*[A-Z])(?=.*[\\s]).{8,}";
	    boolean result = mno.matches(pattern);
	    if (result == false) {
	        ((UIInput) comp).setValid(false);

	        FacesMessage message = new FacesMessage(
	            "invalid Description");
	        context.addMessage(comp.getClientId(context), message);
	    }
	}
	public void validateSpe(FacesContext context, UIComponent comp,
	    Object value) {

	    System.out.println("inside validate method");

	    String mno = (String) value;
	    String pattern = "(?=.*[a-z])(?=.*[A-Z]).{3,}";
	    boolean result = mno.matches(pattern);
	    if (result == false) {
	        ((UIInput) comp).setValid(false);

	        FacesMessage message = new FacesMessage(
	            "invalid Specialization");
	        context.addMessage(comp.getClientId(context), message);
	    }
	}
	
	 public void validateUserName(FacesContext context, UIComponent comp,
	   Object value) {

	   System.out.println("inside validate method");

	   String mno = (String) value;
	   String pattern = "(?=.*[a-z])(?=.*[0-9]).{8,}";
	   boolean result = mno.matches(pattern);
	   if (result == false) {
	     ((UIInput) comp).setValid(false);

	     FacesMessage message = new FacesMessage(
	       "invalid UserName");
	     context.addMessage(comp.getClientId(context), message);
	   }
	 }

	 public void validatePassword(FacesContext context, UIComponent comp,
	   Object value) {

	   System.out.println("inside validate method");

	   String mno = (String) value;
	   String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";
	   boolean result = mno.matches(pattern);
	   if (result == false) {
	     ((UIInput) comp).setValid(false);

	     FacesMessage message = new FacesMessage(
	       "invalid Password");
	     context.addMessage(comp.getClientId(context), message);
	   }
	 }
	 
	 public void validateIssue(FacesContext context, UIComponent comp, Object value) {
		 System.out.println("inside validate method");
         String mno = (String) value;
         String pattern = "(?=.*[a-z])(?=.*[A-Z]).{3,}";
         boolean result=mno.matches(pattern);
         
         if(result==false) {
        	 ((UIInput) comp).setValid(false);
             FacesMessage message = new FacesMessage("Invalid issue name, please enter a valid issue name, and try again.");
             context.addMessage(comp.getClientId(context), message);
         }
     }
}
