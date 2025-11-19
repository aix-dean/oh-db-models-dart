import 'package:flutter_test/flutter_test.dart';

import 'package:oh_db_models/oh_db_models.dart';

void main() {
  test('PaymentMethod fromJson and toJson', () {
    final pm = PaymentMethod(
      type: 'EWALLET',
      channel: 'OVO',
      channelProperties: {'key': 'value'},
    );
    final json = pm.toJson();
    final pm2 = PaymentMethod.fromJson(json);
    expect(pm2.type, 'EWALLET');
    expect(pm2.channel, 'OVO');
    expect(pm2.channelProperties, {'key': 'value'});
  });
}
