pipeline {
    agent { docker { image 'python' } }
       stages {
        stage('Teste') {
            steps {
                sh "pip install robotframework"
                echo "Executando os testes de RPA"
                sh 'robot -d ./logs tests/'
                input(message: 'Terminou?', ok: 'Yes')
            }
        }
    }
}