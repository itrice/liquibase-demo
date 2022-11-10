pipeline{
    agent{
        docker { image 'liquibase/liquibase:latest'}
    }
    stages{
        stage("status"){
            steps{
                sh 'liquibase status --defaultsFile=liquibase.properties'
            }
        }
        stage("update"){
            steps{
                sh 'liquibase update --defaultsFile=liquibase.properties'
            }
        }
    }
    post{
        always{
            cleanWs()
        }
    }
}