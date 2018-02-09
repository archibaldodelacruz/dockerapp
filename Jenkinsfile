node(label: 'Esclavo-01') {
    def app 

    stage('Clone repository'){
        checkout scm 
    }
    
    stage('Build image'){
        echo "${env.BUILD_NUMBER}"
        sh 'docker-compose up -d'
    }

    stage('Test image'){
        sh 'docker exec dockerapp python test.py'
    }

    stage('Push image'){
        sh "docker tag dockerapp docker.victormerino.cl:5000/dockerapp:${env.BUILD_NUMBER}"
        sh "docker push docker.victormerino.cl:5000/dockerapp:${env.BUILD_NUMBER}"
        sh "docker tag dockerapp docker.victormerino.cl:5000/dockerapp:latest"
        sh "docker push docker.victormerino.cl:5000/dockerapp:latest"
        sh "docker tag redis docker.victormerino.cl:5000/redis:${env.BUILD_NUMBER}"
        sh "docker push docker.victormerino.cl:5000/redis:${env.BUILD_NUMBER}"
        sh "docker tag redis docker.victormerino.cl:5000/redis:latest"
        sh "docker push docker.victormerino.cl:5000/redis:latest"

    }

}