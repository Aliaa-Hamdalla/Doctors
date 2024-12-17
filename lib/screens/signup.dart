import 'package:flutter/material.dart';
import 'package:hospital/screens/Home.dart';
import 'package:hospital/screens/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String selectedGender = 'Male';
  String maritalStatus = 'Married';
  double userAge = 18;
  bool notificationsEnabled = false;
  bool termsAccepted = false;

  // Controllers for input fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Validation functions
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        height: double.infinity,
        color: const Color(0xFFF1F5F9), // Light Grayish Blue background
      
      child:Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
    
               const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign up to get started',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 50),
              
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: validateEmail,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: validatePassword,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Gender:'),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value.toString();
                            });
                          },
                        ),
                        const Text('Male'),
                        Radio(
                          activeColor: Colors.blue,
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value.toString();
                            });
                          },
                        ),
                        const Text('Female'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Marital Status:',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: maritalStatus,
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: ['Married', 'Single']
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            maritalStatus = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text('Age: ${userAge.toInt()}'),
                    Expanded(
                      child: Slider(
                        activeColor: Colors.blue,
                        value: userAge,
                        min: 18,
                        max: 100,
                        onChanged: (value) {
                          setState(() {
                            userAge = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Switch(
                      activeColor: Colors.blue,
                      value: notificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          notificationsEnabled = value;
                        });
                      },
                    ),
                    const Text('Receive Notifications'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.blue,
                      value: termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          termsAccepted = value!;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text('I agree to the Terms and Conditions'),
                    ),
                  ],
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Notes',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (!termsAccepted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('You must accept the terms and conditions.'),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                   minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
                 const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Navigate to Sign Up Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    "Have an account? Sign In",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
     ),
    );
  }
}
