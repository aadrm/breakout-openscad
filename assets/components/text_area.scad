use <../resources/fonts/OverpassMono-Bold.ttf>


/*
    text area
    any given text will stay within the area defined by the size parameter

    parameters:
    -txt        text
    -size       a vector [x, y], defines the area that the text will try to fill
    -padding    adds padding to the text area staying within the defined size
*/
module text_area(txt, size, padding = [0,0]){
    // these modifiers are font specific, they adjust the font size
    // so it never grows larger than the bounding box
    // The horizontal modifier will only be exact for monospace fonts
    font_size_modifier_x = 1.2;
    font_size_modifier_y = 1.4;
    x_size = (size.x - padding.x) / len(txt) * font_size_modifier_x;
    y_size = (size.y - padding.y) / font_size_modifier_y;
    font_size = (x_size > y_size) ? y_size : x_size;
    echo(font_size)
    text(
        text = txt,
        font = "OverpassMono-Bold.ttf:style=Bold",
        size = font_size,
        valign = "center",
        halign = "center"
    );
}

/*
    extrudes text staying within the defined area

    parameters:
    -txt        text
    -size       a vector [x, y], defines the area that the text will try to fill
    -padding    a vector [x, y], adds padding to the text area staying within the defined size
    -height     extrude height
*/
module text_area_positive(txt, size, padding, height) {
    linear_extrude(height = height)
    text_area(txt, size, padding);

}


/*
    extrudes the area of the text while the text stays in "negative"

    parameters:
    -txt        text
    -size       a vector [x, y], defines the area that the text will try to fill
    -padding    a vector [x, y], adds padding to the text area staying within the defined size
    -height     extrude height
*/
module text_area_negative(txt, size, padding, height) {
    linear_extrude(height = height)
    difference() {
        square(size, center = true);
        text_area(txt, size, padding);
    }
}

/*
    extrudes the text within the text area and includes a frame defined by the
    margin. notice that if the margin is larger than any value in the padding vector
    the frame will overlap with the text

    parameters:
    -txt        text
    -size       a vector [x, y], defines the area that the text will try to fill
    -padding    a vector [x, y], adds padding to the text area staying within the defined size
    -height     extrude height
*/
module text_area_framed(txt, size, padding, height, margin) {
    linear_extrude(height = height) {
        difference() {
            square(size, center = true);
            square(size - [margin, margin], center = true);
        }
        text_area(txt, size, padding);
    }
}

//showcase
size = [50, 5];
padding = [5, 2];


text_area("the text stays within the 'size' area and respects padding", size, padding);
#difference() {
    square(size, center = true);
    square(size - padding, center = true);
}

height = 2;
translate([0, size.y * 2 ,0])
text_area_positive("Positive text area", size, padding, height);
translate([0, size.y * 4 ,0])
text_area_negative("Negative text area", size, padding, height);

margin = 1;
translate([0, size.y * 6 ,0])
text_area_framed("Framed text area", size, padding, height, margin);