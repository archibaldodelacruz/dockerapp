node(label: 'Esclavo-01') {
    def app 

    stage('Clone repository'){
        checkout scm 
    }
    
    stage('Build image'){
        sh 'docker-compose up -d'
    }

    stage('Test image'){
        sh 'docker exec dockerapp_dockerapp_1 python test.py'
    }

    stage('Push image'){
        docker.withRegistry('https://docker.victormerino.cl:5000'){
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }

    }

}