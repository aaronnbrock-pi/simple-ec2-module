pipeline {
  agent any
  stages {
    stage('Check Tag') {
      when {
        anyOf {
          branch 'master';
          changeRequest target: 'master';
        }
      }
      steps {
        sh '''# Fetch all tags
git fetch --tags

# Create the proposed tag string
to_tag="v$(cat VERSION)"

# Check if proposed tag exists
if [ $(git --no-pager tag -l $to_tag) ]; then
    # Fail if it does
    echo "Git tag $to_tag already exists! (Please updates VERSION file)"
    exit 1
else
    # Pass if it does not
    echo "Git tag $to_tag doesn\'t exist... yet :)"
    exit 0
fi
'''
      }
    }
    stage('Create Tag') {
      when {
        branch 'master'
      }
      steps {
        sshagent (credentials: ['aaronnbrock-pi-github-ssh']) {
          sh '''
git config user.name \'AaronNBrockPI\'
git config user.email \'aaronnbrock-pi@aaronnbrock.com\'

# Create the proposed tag string
to_tag="v$(cat VERSION)"

git tag -a "$to_tag" -m "Release $to_tag"

# Todo: inject this rather than scanning each time
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
git push git@github.com:aaronnbrock-pi/simple-ec2-module.git --tags'''
        }
      }
    }
  }
}
