hexo generate
cp -R public/* .deploy/mpfly.github.io
cd .deploy/mpfly.github.io
git add .
git commit -m “update”
git push origin master