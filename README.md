# learnadex

The 'learnadex' builds on the capabilities and framework provided by the [stochadex package](https://github.com/umbralcalc/stochadex) to enable online learning and provides approximate inference tools for any stochastic simulation.

## Need more context and documentation?

The design, development, implementation details behind and practical documentation for the 'learnadex' can all be found in **Part 1** of this very delightful book: [Worlds of Observation](https://umbralcalc.github.io/worlds-of-observation/).

## Building and running the binary

```shell
# update the go modules
go mod tidy

# build the binary
go build -o bin/ ./cmd/learnadex

# run your configs
./bin/learnadex --settings ./cfg/settings_config.yaml \
--implementations ./cfg/implementations_config.yaml

# run your configs with the real-time dashboard on
./bin/learnadex --settings ./cfg/settings_config.yaml \
--implementations ./cfg/implementations_config.yaml \
--dashboard ./cfg/dashboard_config.yaml
```

## Building and running the logs explorer and visualisation app

```shell
# install the dependencies for and build the visualisation app
cd ./app && npm install && npm run build && cd ..

# build the binary
go build -o bin/ ./cmd/logsplorer

# run the app and checkout http://localhost:3000
./bin/logsplorer --config ./cfg/logsplorer_config.yaml
```

![Using Viz](app/public/using-viz.gif)

## Building and running the Docker containers (may need sudo)

```shell
# build the learnadex container
docker build -f Dockerfile.learnadex --tag learnadex .

# run the binary in the container with your configs
docker run -p 2112:2112 learnadex --settings ./cfg/settings_config.yaml \
--implementations ./cfg/implementations_config.yaml \
--dashboard ./cfg/dashboard_config.yaml

# build the logsplorer container
docker build -f Dockerfile.logsplorer --tag logsplorer .

# run the binary in the container with your config
docker run -p 8080:8080 logsplorer --config ./cfg/logsplorer_config.yaml
```
