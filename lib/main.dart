import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/provider/task_provider.dart';
import 'package:flutter_application_1/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        title: 'Flutter Demo',
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();

    newUser = loginData.getBool('login') ?? false;

    if (newUser == false) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
          (route) => false);
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskScreen(),
            ),
          );
        },
        child: const Text(
          'Task',
        ),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, provider, widget) {
          if (provider.taskModels.isNotEmpty) {
            return ListView.builder(
              itemCount: provider.taskModels.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final task = await provider.getTaskById(
                            provider.taskModels[index].id ?? -1,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskScreen(
                                taskModel: task,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(16),
                          color: Colors.blue,
                          child: Text(
                            provider.taskModels[index].taskName ?? "-",
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        provider.deleteTask(
                          provider.taskModels[index].id!,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Task Deleted',
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    )
                  ],
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'Task Kosong',
              ),
            );
          }
        },
      ),
    );
  }
}




    // body: Container(
      //   width: double.infinity,
      //   child: Form(
      //     key: _formKey,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         TextFormField(
      //           controller: _nameController,
      //         ),
      //         TextFormField(
      //           controller: _emailController,
      //         ),
      //         TextFormField(
      //           controller: _passwordController,
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             final isValidForm = _formKey.currentState!.validate();

      //             String username = _nameController.text;
      //             if (isValidForm) {
      //               loginData.setBool('login', false);
      //               loginData.setString('username', username);
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (_) => HomePage(),
      //                 ),
      //               );
      //             }
      //           },
      //           child: Text(
      //             'Login',
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),