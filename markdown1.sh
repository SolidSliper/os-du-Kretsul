#Використання команд bash
#!/bin/bash
cat <<THE_END # Те саме, якби для кожного окремого рядка писали б echo, але тут в цьому "блоці" можемо писати текст вільно 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
</head>
<body>
THE_END
# У цьому коді умовні оператори реалізовані за прикладом викладача. Прапор -r просто розширює синтаксис
# даючи можливість використовувати знаки {}[]()+ без \. Більше коментарів у markdown.sh
while read LINE
do
	if echo "$LINE" | grep '^# ' >/dev/null; then
		LINE=$(echo "$LINE" | sed 's@^# \(.*\)$@<h1>\1</h1>@')
		echo "$LINE"
	elif echo "$LINE" | grep '^## ' >/dev/null; then
		LINE=$(echo "$LINE" | sed -r 's@^## (.*)$@<h2>\1</h2>@')
		echo "$LINE"
	elif echo "$LINE" | grep '__.*__' >/dev/null; then
		LINE=$(echo "$LINE" | sed -r 's@__([^_]+)__@<strong>\1</strong>@g')
		echo "$LINE"
	elif echo "$LINE" | grep '_.*_' >/dev/null; then
		LINE=$(echo "$LINE" | sed 's@_\([^_]\+\)_@<em>\1</em>@g')
		echo "$LINE"
	elif echo "$LINE" | grep '^\s*$' >/dev/null; then
		echo "<p>"
	else
		echo "$LINE"
	fi
done
echo "</body>"
echo "</html>"

