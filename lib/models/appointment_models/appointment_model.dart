class AppointmentModel {
  late String appointmentId;
  late String donorId;
  late String staffId;
  late String staffName;
  late String hospitalId;
  late String hospitalName;
  late String date;
  late String bloodGroup;
  late bool isActive;
  AppointmentModel(
    {
      required this.appointmentId,
      required this.donorId,
      required this.hospitalId,
      required this.hospitalName,
      required this.staffId,
      required this.staffName,
      required this.date,
      required this.bloodGroup,
      required this.isActive
    }
  );

  static AppointmentModel getEmptyClass()
  {
    return AppointmentModel(
      hospitalName: "",
      staffName: "",
      appointmentId: "", 
      donorId: "", 
      hospitalId: "", 
      staffId: "", 
      date: "", 
      bloodGroup: "", 
      isActive: true
      );
  }
}