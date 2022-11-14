module triangular_right_prism(l, w, h){
    polyhedron(//pt 0        1        2        3        4        5
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,0,h], [l,0,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}
