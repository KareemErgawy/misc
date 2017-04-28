#include <cstddef>
#include <iterator>

template <typename T> class list {
public:
  class node {
    friend class list;

  public:
    node(T Elem, node *Next, node *Prev) : Elem(Elem), Next(Next), Prev(Prev) {}

    friend bool operator==(const node &X, const node &Y) {
      return (X.next == Y.next) && (X.prev == Y.prev) && (X.Elem == Y.Elem);
    }

    node *next() { return Next; }
    T &elem() { return Elem; }

  private:
    T Elem;
    node *Next;
    node *Prev;
  };

  list() {
    Tail = new node(T(), NULL, NULL);
    Head = NULL;
  }

  bool empty() const { return Head == NULL; }

  node *begin() const { return Head; }

  node *end() const { return Tail; }

  node *insert_before(const T &Elem, node *Other) {
    auto *NewNode = new node(Elem, Other, Other->Prev);

    if (Other->Prev != NULL) {
      Other->Prev->Next = NewNode;
    }

    Other->Prev = NewNode;

    return NewNode;
  }

  node *insert_after(const T &Elem, node *Other) {
    auto *NewNode = new node(Elem, Other->Next, Other);

    if (Other->Next != NULL) {
      Other->Next->Prev = NewNode;
    }

    Other->Next = NewNode;

    return NewNode;
  }

  node *insert_front(T Elem) {
    if (empty()) {
      return (Head = insert_before(Elem, Tail));
    } else {
      return (Head = insert_before(Elem, Head));
    }
  }

  node *insert_back(T Elem) { return insert_before(Elem, Tail); }

private:
  node *Head;
  node *Tail;
};
