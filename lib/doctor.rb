class Doctor
    
    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name
        @@all << self 
    end

    def self.all
        @@all
    end 

    # returns all appointments associated with this Doctor
    # select == find_by
    def appointments
        Appointment.all.select {|appointment| appointment.doctor == self}
    end 

    # given a date and a patient, creates a new appointment
    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end 

    # has many patients, through appointments
    # map == collect 
    def patients
        appointments.map {|appointment| appointment.patient}
    end 

    # def patients
    #     appointments.map(&:patient)
    # end
end