enum UrgencyDegree {
  normal(label: '一般', value: 1),
  strict(label: '加严', value: 2),
  decline(label: '减量', value: 3);

  const UrgencyDegree({
    required this.label,
    required this.value,
  });
  final String label;
  final int value;
}

enum ScanResult {
  ng,
  ok;
}

enum ScanCheckStatus {
  processing,
  complete,
  error;
}
