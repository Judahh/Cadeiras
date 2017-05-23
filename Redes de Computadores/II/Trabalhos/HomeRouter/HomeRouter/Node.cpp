#include "Node.h"

template <typename T> Node<T>::Node()
{
}

template <typename T> Node<T>::Node(T _value)
{
	value = _value;
}

template <typename T> Node<T>::Node(Node<T> _after, Node<T> _before, T _value)
{
	_after.setBefore(this);
	after = _after;
	_before.setAfter(this);
	before = _before;
	value = _value;
}

template <typename T> Node<T>::~Node(void)
{
}

template <typename T> Node<T> Node<T>::getAfter(void)
{
	return after;
}

template <typename T> Node<T> Node<T>::getBefore(void)
{
	return before;
}

template <typename T> T Node<T>::getValue(void)
{
	return value;
}

template <typename T> void Node<T>::setAfter(Node<T> _after)
{
	after = _after;
}

template <typename T> void Node<T>::setBefore(Node<T> _before)
{
	before = _before;
}

template <typename T> void Node<T>::setValue(T _value)
{
	value = _value;
}
