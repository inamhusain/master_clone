// Project imports:
import 'package:{{cookiecutter.repo_name}}/config/flavours/app.dart';

void main() async {
  await AppConfig().setAppConfig(environment: Environment.dev);
}
