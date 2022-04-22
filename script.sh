file=$(ls | grep "app")
cmd=$(
    echo "@import url(\"https://cdn.jsdelivr.net/npm/@witches-banquet/karena-wiki-style/dist/dist.css\");"
    cat $file
)
echo "$cmd" >$file
