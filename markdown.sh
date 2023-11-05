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
while read LINE
do
	if [[ $LINE == \#\ * ]] #Якщо рядок починається на '# ' і після нього є знаки(тобто *), то...
	then
		LINE=$(echo "$LINE" | sed 's@^# \(.*\)$@<h1>\1</h1>@') #
		echo "$LINE"
	elif [[ $LINE == \#\#\ * ]] # Те саме що й з '# '
	then
		LINE=$(echo "$LINE" | sed 's@^## \(.*\)$@<h2>\1</h2>@') #
		echo "$LINE"
	elif [[ $LINE == *"__"* ]] # Якщо рядок містиь __ і перед та після __ є знаки, тоді...
	then
		LINE=$(echo "$LINE" | sed -r 's@__([^_]+)__@<strong>\1</strong>@g') #
		echo "$LINE"
	elif [[ $LINE == *"_"* ]] # Те саме що й __
        then
                LINE=$(echo "$LINE" | sed -r 's@_([^_]+)_@<em>\1</em>@g') #
                echo "$LINE"
	elif [[ $LINE == "" ]] # Умова пустого рядка і рядка із пробілами(тобто перевірка чи рядок містить видимі знаки)
        then
                echo "<p>"
        else # Якщо ні одна умова не справдилась, тоді просто надрукуй рядок(чи треба? Не знаю)
    		echo "$LINE"
	fi
done
echo "</body>"
echo "</html>"

