typedef unsigned long long int _uint256t[4];

// Realiza a soma A += B
void bigSum(_uint256t, _uint256t);

// Realiza a soma A++
void bigSumOne(_uint256t);

// Realiza a subtração A -= B
void bigSub(_uint256t, _uint256t);

// Realiza a subtração A--
void bigSubOne(_uint256t, _uint256t);

// Realiza a multiplicação A *= B
void bigMul(_uint256t, _uint256t);

// Realiza a comparação A == B
_Bool bigEql(_uint256t, _uint256t);

// Realiza a comparação A != B
_Bool bigDif(_uint256t, _uint256t);

// Realiza a comparação A > B
_Bool bigGreater(_uint256t, _uint256t);

// Realiza a comparação A < B
_Bool bigLess(_uint256t, _uint256t);
