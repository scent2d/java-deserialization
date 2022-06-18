# java-deserialization

### Docker build

```bash
git clone [https://github.com/scent2d/java-deserialization.git](https://github.com/scent2d/java-deserialization.git)
cd java-deserialization
docker build -t java-deserialization .
```

### Docker run

```bash
docker run -it -p 9999:8080 java-deserialization
```

### Create IAST Server

```bash
python3 -m http.server
```

### Test

- insecure: [http://localhost:9999/InsecureDeserialization/insecure](http://localhost:9999/InsecureDeserialization/insecure)
- secure: [http://192.168.0.104:9999/InsecureDeserialization/secure](http://192.168.0.104:9999/InsecureDeserialization/secure)
- Test Upload **"good.yaml"** or **"mal.yaml"** Upload
