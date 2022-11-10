pipeline{
    agent{
        docker { image 'liquibase/liquibase:latest'}
    }
    stages{
        stage("status"){
            steps{
                sh 'liquibase status --defaultsFile=liquibase.docker.properties'
            }
        }
        stage("update"){
            steps{
                sh 'liquibase update --defaultsFile=liquibase.docker.properties'
            }
        }
    }
    post{
        always{
            cleanWs()
        }
    }
}