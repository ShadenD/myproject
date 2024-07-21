import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Terms and condition'),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Etik enim quam aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaejekh et aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaeque aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaeque aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaeque aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaeque aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandae\n\n'
            'Possimus ipsa ea. Dolorum ea vel et sit voluptatem quis ex. Sequi iusto velit ratione voluptas repudiandaeque aliquid molestiae non. Et enim quam. Et consequatur sunt dicta esse eveniet tempore deserunt.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
