pipeline{
    agent{
        docker { image 'liquibase/liquibase:latest'}
    }
    stages{
        stage('Continuous Deploy'){
            steps{
                sh 'liquibase --version'
            }
        }
    }
}