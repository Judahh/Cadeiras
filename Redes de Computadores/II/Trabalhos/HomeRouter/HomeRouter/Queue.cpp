#include "Queue.h"

template <typename T> Queue<T>::Queue(void)
{
	header = new Node<T>(nullptr, nullptr, nullptr);
	tail = new Node<T>(nullptr, nullptr, nullptr);

	lenght = 0;
}

template <typename T> Queue<T>::Queue(T _initialValue)
{
	header = new Node<T>(nullptr, nullptr, nullptr);
	tail = new Node<T>(nullptr, nullptr, nullptr);

	Node<T> node = new Node(header, tail, _initialValue);

	lenght = 1;
}

template <typename T> Queue<T>::~Queue(void)
{
}

template <typename T> void Queue<T>::addElement(T value)
{
	if(isEmpty())
	{
		Node<T> node = new Node(header, tail, value);
	}
	else
	{
		Node<T> nodeBefore = tail.getBefore();
		Node<T> node = new Node(nodeBefore, tail, value);
	}

	lenght++;
}

template <typename T> bool Queue<T>::isEmpty()
{
	return lenght <= 0;
}

/**
Método para remover elemento na posição do index passado. O primeiro elemento da lista consta na posição 1.
*/
template <typename T> T Queue<T>::removeElementAt(int index)
{
	if(index > lenght)
	{
		return nullptr;
	}
	else
	{
		int actual = 1;
		Node<T> actualNode = header.getAfter();

		while(actual < index)
		{
			actualNode = actualNode.getAfter();
			actual++;
		}

		Node<T> after = actualNode.getAfter();
		Node<T> before = actualNode.getBefore();

		after.setBefore(before);
		before.setAfter(after);

		lenght--;

		return actualNode.getValue();
	}
}

template <typename T> T Queue<T>::removeElement(T value)
{
	if(isEmpty())
	{
		return nullptr;
	}
	else
	{
		int count = 1;

		Node<T> actualNode = header.getAfter();
		bool found = false;

		do
		{
			if(actualNode.getValue() == value)
			{
				count = lenght + 3; //Valor arbitrariamente grande para fazer sair do while
				found = true;
			}

			if(!found)
			{
				actualNode = actualNode.getAfter();
				count++;
			}
		}while(count < lenght);

		if(found)
		{
			Node<T> after = actualNode.getAfter();
			Node<T> before = actualNode.getBefore();

			after.setBefore(before);
			before.setAfter(after);

			lenght--;

			return actualNode.getValue();
		}
		else
		{
			return nullptr;
		}
	}
}

template <typename T> T Queue<T>::removeFirst()
{
	if(isEmpty())
	{
		return nullptr;
	}
	else
	{
		Node<T> actualNode = header.getAfter();

		Node<T> after = actualNode.getAfter();
		Node<T> before = actualNode.getBefore();

		after.setBefore(before);
		before.setAfter(after);

		lenght--;

		return actualNode.getValue();
	}
}

template <typename T> int Queue<T>::size()
{
	return lenght;
}