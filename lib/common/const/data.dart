import 'dart:io';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

final emulatorId = '10.0.2.2:28080';
final simulatorId = '127.0.0.1:28080';

final ip = Platform.isIOS ? simulatorId : emulatorId;