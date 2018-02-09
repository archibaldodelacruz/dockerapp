node(label: 'Esclavo-01') {
    def app 

    stage('Clone repository'){
        checkout scm 
    }
    
    stage('Build image'){

        app = docker.build('docker.victormerino.cl/dockerapp')
    }

    stage('Test image'){

        app.inside{
            sh 'python test.py'
        }
    }

    stage('Push image'){
        docker.withRegistry('https://docker.victormerino.cl:5000'){
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }

    }

}