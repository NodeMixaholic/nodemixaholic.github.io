echo "# BLOATLESS VIDEOS :-)" > 0.md;
echo "## OPEN WITH FFPLAY." >> 0.md;
echo "" >> 0.md;
echo "---" >> 0.md;
echo "" >> 0.md;
cd bloatless-videos
for f in *; do mv "$f" `echo $f | tr ' ' '_'`; done
for f in $(ls *.mp4);
do
echo "* [$f](bloatless-videos/$f) ">> ../0.md
done
cd ../
echo "" >> 0.md;
echo "---" >> 0.md
echo "" >> 0.md;
echo "Copyright Samuel Lord. All rights reserved." >> 0.md
pandoc 0.md -o vids.html
