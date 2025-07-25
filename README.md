# 🧰 Web Dev Tools App

This is a containerized **Web Development Toolkit** offering useful utilities via a web interface. The app includes:

### 🛠️ Available Tools
- ✅ **Chmod Calculator** – Quickly generate Linux file permission commands  
- ✅ **Crontab Generator** – Easily build crontab expressions  
- ✅ **Unix Timestamp Converter** – Convert to/from Unix time  
- ✅ **Password Generator** – Generate strong, customizable passwords  

---

## 🚀 Features
- 🐳 **Dockerized**: Easy to deploy using a container
- ☸️ **Kubernetes Deployment**: Fully managed and scalable using Kubernetes
- 🔄 **CI/CD with Jenkins**: Automated build and deployment pipeline using Jenkins

---

## 📦 Docker Image

The Docker image is available on Docker Hub:  
👉 `akashgupta2233/web-dev-tools:v1`

Pull it using:
```bash
docker pull akashgupta2233/web-dev-tools:v1

---

kubectl port-forward svc/web-dev-tools-service 8080:80
