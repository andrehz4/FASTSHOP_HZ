pipeline {
    agent { docker { image 'andrehz/python' } }
       stages {
           stage('Build') {
            steps {
                echo "Instalando"
                sh "pip install -r requirements.txt"
                }
                }
        stage('Teste') {
            steps {
                echo "Executando os testes de RPA"
                sh 'robot -d ./logs tests/'
                robot 'logs'
                robot otherFiles: '**/*.png', outputPath: 'logs'
                input(message: 'Terminou?', ok: 'Yes')
            }
        }
   } 
}