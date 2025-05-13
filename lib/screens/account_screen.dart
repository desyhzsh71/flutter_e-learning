import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // Daftar akun dengan data awal
  List<Map<String, String>> accounts = [
    {
      'name': 'Jeo',
      'email': 'jeongwoo@example.com',
      'nim': '123456789',
      'major': 'Computer Science',
      'profile': 'images/Jeongwoo.jpg', // Path gambar profil
    },
  ];

  void _addAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountFormPage(onSave: (newAccount) {
          setState(() {
            accounts.add(newAccount);
          });
        }),
      ),
    );
  }

  void _editAccount(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountFormPage(
          initialAccount: accounts[index],
          onSave: (updatedAccount) {
            setState(() {
              accounts[index] = updatedAccount;
            });
          },
        ),
      ),
    );
  }

  void _deleteAccount(int index) {
    setState(() {
      accounts.removeAt(index);
    });
  }

  void _viewAccount(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountDetailPage(account: accounts[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Account Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Accounts', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  final account = accounts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(account['profile']!),
                        radius: 30,
                      ),
                      title: Text(
                        account['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        account['email']!,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      onTap: () => _viewAccount(index),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editAccount(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteAccount(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _addAccount,
              icon: Icon(Icons.add),
              label: Text('Add Account'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountFormPage extends StatefulWidget {
  final Map<String, String>? initialAccount;
  final Function(Map<String, String>) onSave;

  AccountFormPage({this.initialAccount, required this.onSave});

  @override
  _AccountFormPageState createState() => _AccountFormPageState();
}

class _AccountFormPageState extends State<AccountFormPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _nimController;
  late TextEditingController _majorController;
  String _selectedProfile = 'images/Jeongwoo.jpg';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialAccount?['name']);
    _emailController = TextEditingController(text: widget.initialAccount?['email']);
    _nimController = TextEditingController(text: widget.initialAccount?['nim']);
    _majorController = TextEditingController(text: widget.initialAccount?['major']);
    _selectedProfile = widget.initialAccount?['profile'] ?? 'images/Jeongwoo.jpg';
  }

  void _saveAccount() {
    final newAccount = {
      'name': _nameController.text,
      'email': _emailController.text,
      'nim': _nimController.text,
      'major': _majorController.text,
      'profile': _selectedProfile,
    };
    widget.onSave(newAccount);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.initialAccount == null ? 'Add Account' : 'Edit Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _nimController,
              decoration: InputDecoration(labelText: 'NIM'),
            ),
            TextField(
              controller: _majorController,
              decoration: InputDecoration(labelText: 'Major'),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedProfile,
              items: [
                'images/Jeongwoo.jpg',
                'images/Doyoung.jpg',
                'images/Biology.png',
                'images/Chemistry.png',
                'images/History.png',
                'images/Language.png',
                'images/Matematics.png',
                'images/Physics.png',
              ].map((path) {
                return DropdownMenuItem(
                  value: path,
                  child: Text(path.split('/').last),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedProfile = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: _saveAccount,
              child: Text('Save Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountDetailPage extends StatelessWidget {
  final Map<String, String> account;

  AccountDetailPage({required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(account['name']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(account['profile']!),
              ),
            ),
            SizedBox(height: 20),
            Text('Name: ${account['name']}', style: TextStyle(fontSize: 18)),
            Text('Email: ${account['email']}', style: TextStyle(fontSize: 18)),
            Text('NIM: ${account['nim']}', style: TextStyle(fontSize: 18)),
            Text('Major: ${account['major']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}