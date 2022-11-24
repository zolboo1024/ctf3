#!/bin/bash
christmas_time=1671926400
current_time=$(cat /home/anotheruser/current_time.txt)
$(eval $current_time)
echo "Time of Christmas: $christmas_time" > /home/anotheruser/when_is_christmas.txt
echo "Time now: $current_time" >> /home/anotheruser/when_is_christmas.txt
