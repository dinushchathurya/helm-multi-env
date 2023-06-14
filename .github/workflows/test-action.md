name: Deploy Helm Chart

on:
  push:
    branches:
      - master

permissions: write-all

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:

      - name: Checkout code
        uses: actions/checkout@v2

      - name: Helm tool installer
        uses: Azure/setup-helm@v3

      - name: Check Helm version
        run: helm version

      - name: Generate Random Semantic Version
        id: random-version
        run: echo "::set-output name=version::$(echo v0.$((1 + RANDOM % 9)).$((1 + RANDOM % 9)))-${{ github.run_number }}"
        
      - name: Package Helm Chart
        run: |
          helm package --version ${{ steps.random-version.outputs.version }} ./tomcat-chart

      # - name: Update chart repo index
      #   run: |
          # helm repo index --url https://github.com/dinushchathurya/tomcat-helm-multi-env --merge index.yaml .
          # helm repo index --merge index.yaml .
          # git config --local user.email "actions@github.com"
          # git config --local user.name "GitHub Actions"
          # git add .
          # git commit -m "feat: Update chart index with version ${{ steps.random-version.outputs.version }}"
          # git push https://dinushchathurya:${{ secrets.PAT_TOKEN }}@github.com/dinushchathurya/helm-chart-tomcat.git HEAD:main -f

      - name: Update chart repo index
        run: |
          helm repo index --merge index.yaml .
          git config --local user.email "actions@github.com"
          git config --local user.name "GitHub Actions"
          git add .
          git commit -m "feat: Update chart index"
          git push https://dinushchathurya:${{ secrets.PAT_TOKEN }}@github.com/dinushchathurya/tomcat-helm-multi-env.git HEAD:master -f

      # - name: Configure AWS credentials
      #   uses: aws-actions/configure-aws-credentials@v1
      #   with:
      #     aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
      #     aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      #     aws-region: ap-southeast-1
      
      # - name: Update kubeconfig
      #   run: |
      #     aws eks update-kubeconfig --name test --region ap-southeast-1
    
      # - name: Add chart and update
      #   run: |
      #     helm repo add tomcat-chart https://dinushchathurya.github.io/tomcat-helm-multi-env
      #     helm repo update
      #     helm repo list
      #     helm upgrade tomcat-chart tomcat-chart/tomcat-chart --install --version ${{ steps.random-version.outputs.version }} --create-namespace --namespace dev 
        
