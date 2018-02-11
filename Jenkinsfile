node(label: 'Esclavo-01') {
    def proyectname = "build${env.BUILD_NUMBER}"
    def docker_app = "${proyectname}_dockerapp"

    stage('Clone repository'){
        checkout scm 
        echo "Docker_app : ${docker_app}"
        echo "proyect name : ${proyectname}"
    }
    
    stage('Build image'){
        sh "docker-compose -p ${proyectname} up -d "
    }

    /*stage('Test image'){
        try{
            echo "Docker_app : ${docker_app}"
            echo "proyect name : ${proyectname}"
            sh "docker exec ${docker_app}_1 python test.py"
        }
        catch(exc){
            sh "docker-compose -p ${proyectname} down"
        }
        
    }*/

    stage('Push image'){
        try{
            /*sh "docker tag ${docker_app} docker.victormerino.cl:5000/dockerapp:${env.BUILD_NUMBER}"
            sh "docker push docker.victormerino.cl:5000/dockerapp:${env.BUILD_NUMBER}"
            sh "docker tag ${docker_app} docker.victormerino.cl:5000/dockerapp:latest"
            sh "docker push docker.victormerino.cl:5000/dockerapp:latest"
            sh "docker tag redis:3.2.0 docker.victormerino.cl:5000/redis:${env.BUILD_NUMBER}"
            sh "docker push docker.victormerino.cl:5000/redis:${env.BUILD_NUMBER}"
            sh "docker tag redis:3.2.0  docker.victormerino.cl:5000/redis:latest"
            sh "docker push docker.victormerino.cl:5000/redis:latest"
            */
            sh "docker-compose -p ${proyectname} push"
        }
        catch(exc){
            sh "docker-compose -p ${proyectname} down"
        }
    }

    stage('clean'){
        //sh "docker-compose -p ${proyectname} down"
        echo 'Clean stage'
    }
}