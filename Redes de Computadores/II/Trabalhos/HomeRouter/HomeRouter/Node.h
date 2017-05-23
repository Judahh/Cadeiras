#pragma once

template <typename T> class Node
{
public:
	Node(void);
	Node(T _value);
	Node(Node<T> _after, Node<T> _before, T _value);
	~Node(void);

	Node<T> getAfter(void);
	Node<T> getBefore(void);
	T getValue(void);

	void setAfter(Node<T> _after);
	void setBefore(Node<T> _before);
	void setValue(T _value);
private:
	Node<T> *after;
	Node<T> *before;
	T value;
};

