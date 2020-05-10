class Patient

    attr_accessor :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def new_appointment(doctor, date)
      Appointment.new(date, self, doctor)
    end
  
    # returns all appointments associated with this Patient
    def appointments
      Appointment.all.select { |appointment| appointment.patient == self }
    end
  
    # Patient has many doctors through appointments 
    def doctors
        appointments.map {|appointment| appointment.doctor}
    end 
    # def doctors
    #   appointments.map(&:doctor)
    # end

  end