class Auth {


  bool isPasswordSecure(String password) {
    // Verifica si la contraseña tiene al menos 8 caracteres.
    if (password.length < 8) {
      return false;
    }

    // Verifica si la contraseña contiene al menos una letra mayúscula.
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    // Verifica si la contraseña contiene al menos un número.
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    // Verifica si la contraseña contiene al menos un carácter especial.
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }

    // Si la contraseña cumple con todos los requisitos, es segura.
    return true;
  }

  bool isUcbEmail(String email) {
    // Verifica si la dirección de correo electrónico termina en "@ucb.edu.bo".
    return email.endsWith("@ucb.edu.bo");
  } 

}