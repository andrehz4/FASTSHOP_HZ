pipeline {
    agent { docker { image 'python' } }
       stages {
           stage('Build') {
            steps {
                echo "Instalando"
                sh "pip install requirements.txt"
                }
                }
        stage('Teste') {
            steps {
                echo "Executando os testes de RPA"
                sh 'robot -d ./logs tests/'
                input(message: 'Terminou?', ok: 'Yes')
            }
        }
   } 
}