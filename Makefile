all : report/_build/html/index.html

results/isles.dat : scripts/wordcount.py data/isles.txt 
	python scripts/wordcount.py --input_file=data/isles.txt --output_file=results/isles.dat

results/figure/isles.png : scripts/plotcount.py results/isles.dat
	python scripts/plotcount.py --input_file=results/isles.dat --output_file=results/figure/isles.png

report/_build/html/index.html : report/count_report.ipynb \
report/_toc.yml \
report/_config.yml \
results/figure/isles.png 
	jupyter-book build report

clean:
	rm -f results/isles.dat
	rm -f results/figure/isles.png
	rm -rf report/_build
