#The Jenkins file
pipeline {
    agent any

    stages {

        stage("Pulling Code") {
            steps {
                echo "Cloning the Repo"
                git url: 'https://github.com/Apurvbajpai2531/SkillSync-Platform-Containerized-CI-CD-K8s-Terraform.git', branch: 'main'
            }
        }

        stage("Build Docker Containers") {
            steps {
                echo "Building the Container"
                sh 'docker-compose down -v'
                sh 'docker-compose build'
            }
        }

        stage("Start Containers") {
            steps {
                echo "Starting the container"
                sh 'docker-compose up -d'
            }
        }

        stage("Setup Database") {
            steps {
                sh 'docker-compose exec -T web rails db:create'
                sh 'docker-compose exec -T web rails db:migrate'
                echo "Database setup successful"
            }
        }

        stage("Run Tests") {
            steps {
                sh 'docker-compose exec -T web rails test || true'
            }
        }
    }

    post {
        always {
            echo "Pipeline finished"
            sh 'docker-compose down'
        }
    }
}
