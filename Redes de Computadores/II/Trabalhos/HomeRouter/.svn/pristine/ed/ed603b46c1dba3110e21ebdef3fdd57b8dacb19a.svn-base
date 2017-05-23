#pragma once
#include "Node.h"

template <typename T> class Queue
{
public:
	Queue(void);
	Queue(T _initialValue);
	~Queue(void);

	void addElement(T value);
	T removeElementAt(int index);
	T removeElement(T value);
	T removeFirst(void);
	int size(void);
	bool isEmpty(void);

private:
	Node<T> header;
	Node<T> tail;
	int lenght;
};

