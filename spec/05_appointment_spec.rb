require "spec_helper"

describe "Appointment" do

  describe ".all" do
    it "knows about all appointments that have been created" do
      doctor_who = Doctor.new("The Doctor")
      hevydevy = Patient.new("Devin Townsend")
      doctor_who.new_appointment(hevydevy, "Friday, January 22nd")
      appointment = doctor_who.new_appointment(hevydevy, "Saturday, January 22nd")
      doctor_who.new_appointment(hevydevy, "Saturday, January 24nd")

      expect(Appointment.all).to include(appointment)
    end
  end

  describe "#new" do
    it "initializes with a date, patient, and doctor" do
      doctor_who = Doctor.new("The Doctor")
      hevydevy = Patient.new("Devin Townsend")

      expect{Appointment.new("Friday, January 22nd", hevydevy, doctor_who)}.to_not raise_error
    end
  end

  describe "#patient" do
    it "belongs to a patient" do
      doctor_who = Doctor.new("The Doctor")
      hevydevy = Patient.new("Devin Townsend")
      appointment = doctor_who.new_appointment(hevydevy, "Friday, January 22nd")
      expect(appointment.patient).to eq(hevydevy)
    end
  end

  describe "#doctor" do
    it "belongs to a doctor" do
      doctor_who = Doctor.new("The Doctor")
      hevydevy = Patient.new("Devin Townsend")
      appointment = doctor_who.new_appointment(hevydevy, "Friday, January 22nd")
      expect(appointment.doctor).to eq(doctor_who)
    end
  end
end
