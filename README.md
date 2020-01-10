## Enigma Machine ##

* Setup Testing Files - Rake And Helper

### Initial Ideas ###

Enigma class will be the main class and the user functioning methods will exist in that

Also want a Shift class.  This will generate the shift key.  The Shift Key attribute will be callable and it will be a Hash with Four Keys And the shifted array to work against.

Key = {
  A => char_array.shift(A shift),
  B => char_array.shift(B shift),
  C => char_array.shift(C shift),
  D => char_array.shift(D shift)
}

The shift class will also be responsible for generating the random number.  To generate a random number with a zero padding.

The first method I can think to do this is just convert the random number to a string and then unshift 0 onto the front until its length == 5.

Next part of the shift class will need to get the Date and format it to a useable set of numbers if one isn't provided.

DateTime.now.strftime(%d%m%y)  -

%d - gives a zero padded day
%m - gives a zero padded month
%y - gives a zero padded year

Once I have the random shift and the Date information I can find the information I need.

The random number with do an each_con(2) to split it into four arrays with each consecutive number together.  Then turn these back to integers.

The Date will be squared and then pull the last 4 digits from (x.to_s[-4..-1].chars)

The random number will then have this operation done to it rand_num.to_s.chars.each_cons(2) {|array_slice| key_holder <<  array_slice.join.to_i}

This will make an array with 4 elements.  The final task will be to map through the elements and add them to the date array.

array.map.with_index {|index, num| num + date_array[index].to_i}

This will create the final shift sections.  

With this we can reduce a hash with array.each_with_index.reduce({}) { |acc, (value, index)| acc[(65 + index).chr] = value + date_array[index];acc}

This will give me the result I want above.