node(label: 'Esclavo-01') {
    def proyectname = "build_${env.BUILD_NUMBER}_"
    def docker_app = "${proyectname}dockerapp_1"
    def redis_app = "${proyectname}redisapp_1"
    stage('Clone repository'){
        checkout scm 
        echo "Docker_app : ${docker_app}"
        echo "Redis_app : ${redis_app}"
        echo "proyect name : ${proyectname}"
    }
    
    stage('Build image'){
        sh "docker-compose -p ${proyectname} up -d "
    }

    stage('Test image'){
        echo "Docker_app : ${docker_app}"
        echo "Redis_app : ${redis_app}"
        echo "proyect name : ${proyectname}"
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