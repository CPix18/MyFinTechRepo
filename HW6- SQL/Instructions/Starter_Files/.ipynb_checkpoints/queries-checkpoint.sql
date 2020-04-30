{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "#\n",
    "select \n",
    "card_holder.holder_name,\n",
    "round(cast(sum(\"transaction\".amount) as numeric),2) as totalsum\n",
    "from card_holder\n",
    "inner join credit_card \n",
    "on card_holder.holder_id = credit_card.holder_id\n",
    "inner join \"transaction\" \n",
    "on credit_card.card_number = \"transaction\".card_number\n",
    "group by card_holder.holder_name\n",
    "order by totalsum asc;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# \n",
    "select ch.holder_name card_holder, t.date, t.amount\n",
    "from transaction t\n",
    "join credit_card cc\n",
    "on t.card_number = cc.card_number\n",
    "join card_holder ch\n",
    "on cc.holder_id = ch.holder_id\n",
    "where extract(hour from t.date) between 7 and 8;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Find the top 10 by largest amount transactions \n",
    "select ch.holder_name card_holder, t.date, \n",
    "round(cast(t.amount as numeric),2) as amount\n",
    "from transaction t\n",
    "join credit_card cc\n",
    "on t.card_number = cc.card_number\n",
    "join card_holder ch\n",
    "on cc.holder_id = ch.holder_id\n",
    "where extract(hour from t.date) between 7 and 8\n",
    "order by t.amount desc\n",
    "limit 10;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Find all transaction amounts under $2\n",
    "select count(*) from transaction t\n",
    "where t.amount < 2 and extract(hour from transaction.date) between 7 and 8\n",
    "order by t.amount asc;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "select count(*) from transaction --3500\n",
    "where transaction.amount <= 2 --353\n",
    "and extract(hour from transaction.date) between 7 and 8;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# top 5 merchants with under $2 transactions\n",
    "select merchant_name, count(*) from transaction t\n",
    "inner join merchant m\n",
    "on m.merchant_id = t.merchant_id\n",
    "where t.amount <= 2\n",
    "group by merchant_name\n",
    "having count(*) >= 5\n",
    "order by count(*) desc;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "select card_number, count(*) from transaction t\n",
    "where t.amount <= 2\n",
    "group by card_number \n",
    "order by count(*) desc;"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.7.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
