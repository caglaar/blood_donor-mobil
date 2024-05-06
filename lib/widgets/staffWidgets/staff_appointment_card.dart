import 'package:e_blood_donor/const/color_const.dart';
import 'package:e_blood_donor/models/appointment_models/appointment_model.dart';
import 'package:e_blood_donor/service/staff_services/staff_appointment_service.dart';
import 'package:flutter/material.dart';

class StaffAppointmentCard extends StatefulWidget {
  const StaffAppointmentCard({Key? key, required this.appointment});

  final AppointmentModel appointment;

  @override
  _StaffAppointmentCardState createState() => _StaffAppointmentCardState();
}

class _StaffAppointmentCardState extends State<StaffAppointmentCard> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return _isVisible
        ? Card(
            color: Color.fromARGB(255, 248, 230, 209),
            margin: EdgeInsets.all(8.0),
            elevation: 4.0,
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(widget.appointment.hospitalName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date: ${widget.appointment.date}"),
                        Text("Staff Name: ${widget.appointment.staffName}"),
                        Text("Active: ${widget.appointment.isActive ? 'Yes' : 'No'}"),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    print("appId${widget.appointment.appointmentId}");
                    StaffAppointmentServices().approveAppointment(widget.appointment);
                    setState(() {
                      _isVisible = false;
                    });
                  },
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check_outlined,
                        size: 40,
                        color: ColorStyles.appBarBackgroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : SizedBox(); // Görünmez durumda ise boş bir SizedBox döndür
  }
}
