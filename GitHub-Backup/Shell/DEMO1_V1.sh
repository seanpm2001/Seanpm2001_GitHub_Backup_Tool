usr="MyName";
url="https://api.github.com/users/${usr}/repos";
num=$(curl -sI "$url?page=1&per_page=100" | sed -nr 's/^Link:.*page=([0-9]+)&per_page=100>; rel="last".*/\1/p');
for ((i=1;i<=$num;i++)); do ( curl -s "$url?page=${i}&per_page=100" | grep "clone_url" | sed -nr 's/.*clone_url": "(.*)",/git clone \1/p' ); done >clone_allrepos_${usr}.sh

