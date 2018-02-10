node(label: 'Esclavo-01') {
    def docker_app = "build_${env.BUILD_NUMBER}_dockerapp_1"
    def redis_app = "build_${env.BUILD_NUMBER}_redisapp_1"
    stage('Clone repository'){
        checkout scm 
    }
    
    stage('Build image'){
        echo "${env.BUILD_NUMBER}"
        sh "docker-compose -p build_${env.BUILD_NUMBER} up -d "
    }

    stage('Test image'){
        sh "docker exec ${docker_app} python test.py"
    }

    stage('Push image'){
        sh "docker tag ${docker_app} docker.victormerino.cl:5000/dockerapp:${env.BUILD_NUMBER}"
        sh "docker push docker.victormerino.cl:5000/dockerapp:${env.BUILD_NUMBER}"
        sh "docker tag ${docker_app} docker.victormerino.cl:5000/dockerapp:latest"
        sh "docker push docker.victormerino.cl:5000/dockerapp:latest"
        sh "docker tag ${redis_app} docker.victormerino.cl:5000/redis:${env.BUILD_NUMBER}"
        sh "docker push docker.victormerino.cl:5000/redis:${env.BUILD_NUMBER}"
        sh "docker tag ${redis_app} docker.victormerino.cl:5000/redis:latest"
        sh "docker push docker.victormerino.cl:5000/redis:latest"

    }

}