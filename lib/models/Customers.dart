class Customers {
  final String activityId;
  final String custName;
  final String time;
  final String documentId;


  Customers({
    this.activityId,
    this.custName,
    this.time,
    this.documentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'activityId': activityId,
      'custName': custName,
      'time': time,
    };
  }
  static Customers fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Customers(
      activityId: map['activityId'],
      custName: map['custName'],
      time: map['waitingTime'],
      documentId: documentId,

    );
  }
}
