function docker-cleanup(){
	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

function docker-delete-stopped(){
	local name=$1
	local state=$(docker inspect --format "{{.State.Running}}" $name 2>/dev/null)

	if [[ "$state" == "false" ]]; then
		docker rm $name
	fi
}

function docker-remove-images(){
  docker rmi -f $(docker images -aq)
}

function docker-default(){
  docker-machine restart default
  eval $(docker-machine env default)
}

function docker-kill-all(){
  docker rm -f $(docker ps -aq)
}

function relies_on(){
	local containers=$@

	for container in $containers; do
		local state=$(docker inspect --format "{{.State.Running}}" $container 2>/dev/null)

		if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
			echo "$container is not running, starting it for you."
			$container
		fi
	done
}

ds(){
  docker ps "$@"
}

dcu(){
  docker-compose up "$@"
}

aws(){
	docker run -it --rm \
		-v $HOME/.aws:/root/.aws \
		--log-driver none \
		--name aws \
		jess/awscli "$@"
}
