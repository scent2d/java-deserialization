# java-deserialization

- docker build
  git clone https://github.com/scent2d/java-deserialization.git
  cd java-deserialization
  docker build -t java-deserialization .

- docker run
  docker run -it -p 9999:8080 java-deserialization

- Create IAST Server
  python3 -m http.server

- Access web
  - insecure: http://localhost:9999/InsecureDeserialization/insecure
  - secure: http://192.168.0.104:9999/InsecureDeserialization/secure

- Test Upload
  "good.yaml" or "mal.yaml" Upload

