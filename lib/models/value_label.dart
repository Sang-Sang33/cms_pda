enum CheckStatus {
  normal(label: '一般', value: 1),
  strict(label: '加严', value: 2),
  decline(label: '减量', value: 3);

  const CheckStatus({
    required this.label,
    required this.value,
  });
  final String label;
  final int value;
}

enum ScanResult {
  ng(label: '设置扫码为NG', value: 0),
  ok(label: '设置扫码为OK', value: 1);

  const ScanResult({
    required this.label,
    required this.value,
  });
  final String label;
  final int value;
}
